/*******************************************************************************
 *
 *  Copyright (C) 2012-2013 Broadcom Corporation
 *
 *  This program is the proprietary software of Broadcom Corporation and/or its
 *  licensors, and may only be used, duplicated, modified or distributed
 *  pursuant to the terms and conditions of a separate, written license
 *  agreement executed between you and Broadcom (an "Authorized License").
 *  Except as set forth in an Authorized License, Broadcom grants no license
 *  (express or implied), right to use, or waiver of any kind with respect to
 *  the Software, and Broadcom expressly reserves all rights in and to the
 *  Software and all intellectual property rights therein.
 *  IF YOU HAVE NO AUTHORIZED LICENSE, THEN YOU HAVE NO RIGHT TO USE THIS
 *  SOFTWARE IN ANY WAY, AND SHOULD IMMEDIATELY NOTIFY BROADCOM AND DISCONTINUE
 *  ALL USE OF THE SOFTWARE.
 *
 *  Except as expressly set forth in the Authorized License,
 *
 *  1.     This program, including its structure, sequence and organization,
 *         constitutes the valuable trade secrets of Broadcom, and you shall
 *         use all reasonable efforts to protect the confidentiality thereof,
 *         and to use this information only in connection with your use of
 *         Broadcom integrated circuit products.
 *
 *  2.     TO THE MAXIMUM EXTENT PERMITTED BY LAW, THE SOFTWARE IS PROVIDED
 *         "AS IS" AND WITH ALL FAULTS AND BROADCOM MAKES NO PROMISES,
 *         REPRESENTATIONS OR WARRANTIES, EITHER EXPRESS, IMPLIED, STATUTORY,
 *         OR OTHERWISE, WITH RESPECT TO THE SOFTWARE.  BROADCOM SPECIFICALLY
 *         DISCLAIMS ANY AND ALL IMPLIED WARRANTIES OF TITLE, MERCHANTABILITY,
 *         NONINFRINGEMENT, FITNESS FOR A PARTICULAR PURPOSE, LACK OF VIRUSES,
 *         ACCURACY OR COMPLETENESS, QUIET ENJOYMENT, QUIET POSSESSION OR
 *         CORRESPONDENCE TO DESCRIPTION. YOU ASSUME THE ENTIRE RISK ARISING OUT
 *         OF USE OR PERFORMANCE OF THE SOFTWARE.
 *
 *  3.     TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT SHALL BROADCOM OR
 *         ITS LICENSORS BE LIABLE FOR
 *         (i)   CONSEQUENTIAL, INCIDENTAL, SPECIAL, INDIRECT, OR EXEMPLARY
 *               DAMAGES WHATSOEVER ARISING OUT OF OR IN ANY WAY RELATING TO
 *               YOUR USE OF OR INABILITY TO USE THE SOFTWARE EVEN IF BROADCOM
 *               HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES; OR
 *         (ii)  ANY AMOUNT IN EXCESS OF THE AMOUNT ACTUALLY PAID FOR THE
 *               SOFTWARE ITSELF OR U.S. $1, WHICHEVER IS GREATER. THESE
 *               LIMITATIONS SHALL APPLY NOTWITHSTANDING ANY FAILURE OF
 *               ESSENTIAL PURPOSE OF ANY LIMITED REMEDY.
 *
 *******************************************************************************/
package com.broadcom.bt.settings;

import java.util.List;

import com.android.bluetooth.R;
import com.android.bluetooth.btservice.AdapterService;

import com.broadcom.bt.service.IProfileStateChangeListener;
import com.broadcom.bt.service.ProfileConfig;
import com.broadcom.bt.service.ProfileConfig.ProfileCfg;

import com.broadcom.bt.settings.HeaderAdapter.HeaderViewHolder;
import com.broadcom.bt.service.settings.ModeAdvancedSettings;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceActivity.Header;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.content.res.Resources;
import android.app.Activity;

import android.content.ContentResolver;
import android.provider.Settings;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.android.bluetooth.hfp.HeadsetService;

public class BluetoothAdvancedSettings extends PreferenceActivity implements
        HeaderAdapter.OnCheckedChangeListener, IProfileStateChangeListener {
    private static final String TAG = "BtSettings.BluetoothAdvancedSettings";
    public static final String EXTRA_PROFILE_NAME = "profileName";

    public static final String EXTRA_DEVICE_MODE = "deviceMode";

    private static final String SETTINGS_PREFIX = "bt_svcst_";
    private static Context mContext;
    private static final Object[] MODE= {
                            R.string.active_mode
                        };

    private static boolean isDeviceModeSwitchInProgress = false;

    private static class AdvancedSettingsHeaderAdapter extends HeaderAdapter {
        public boolean getSwitchState(Header header) {
       String deviceModeName = header.extras
                   .getString(BluetoothAdvancedSettings.EXTRA_DEVICE_MODE);

            if (deviceModeName != null)
            {
                Log.d(TAG, "Getting device mode switch state for " + deviceModeName);
                boolean isEnabled = isDeviceModeEnabled(deviceModeName);
                Log.d(TAG, "device mode enabled? " + isEnabled);
                return isEnabled;
            }

            String profileName = header.extras
                    .getString(BluetoothAdvancedSettings.EXTRA_PROFILE_NAME);
            Log.d(TAG, "Getting switch state for " + profileName);
            boolean isEnabled = isProfileEnabledAndStarted(profileName);
            Log.d(TAG, "Profile enabled? " + isEnabled);
            return isEnabled;
        }

        public AdvancedSettingsHeaderAdapter(Context context, List<Header> objects) {
            super(context, objects);
        }

        protected int getHeaderType(Header header) {
            return HEADER_TYPE_SWITCH;
        }

        protected int getHeaderLayoutResId(int headerType) {
            switch (headerType) {
            case HEADER_TYPE_SWITCH:
                return R.layout.preference_header_switch_item;
            }
            return -1;
        }

    }

    protected boolean isValidFragment(String fragmentName) {
        // TODO: Check validation of fragment after adding fragment.
        return true;
    }

    private static boolean isProfileServiceStarted(String profileName) {
        AdapterService svc = AdapterService.getAdapterService();
        if (svc == null) {
            return false;
        }
        return svc.isProfileStarted(profileName);
    }

    private static boolean isProfileEnabledAndStarted(String profileName) {
        return ProfileConfig.isProfileConfiguredEnabled(profileName)
                && isProfileServiceStarted(profileName);
    }


    private boolean setProfileState(String profileName, boolean setEnabled) {
        ProfileConfig.saveProfileSetting(profileName, setEnabled);
        AdapterService svc = AdapterService.getAdapterService();
        boolean result = false;
        if (svc == null) {
            return false;
        }
        svc.setProfileStateChangeListener(this);

        ProfileConfig.saveProfileSetting(profileName, setEnabled);

        result = svc.setProfileState(profileName, setEnabled);

        if (result == true)
            svc.sendUUIDChange(AdapterService.MESSAGE_DELAY_FOR_SEND_UUID_CHANGED);

        return result;
    }


    AdvancedSettingsHeaderAdapter mAdapter;
    AdapterService mService;

    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "onCreate"+mAdapter);
        super.onCreate(savedInstanceState);
        mService = AdapterService.getAdapterService();

        if (mService != null) {
            mService.setProfileStateChangeListener(this);
        }
    }

    protected void onDestroy() {
        Log.d(TAG, "onDestroy"+mAdapter);
        if (mService != null) {
            mService.unsetProfileStateChangeListener();
            mService = null;
        }
        super.onDestroy();
    }

    public void onResume() {
     Log.d(TAG, "onResume");

     super.onResume();

     if (mService != null) {
         mService.setProfileStateChangeListener(this);
     }


     if (mAdapter == null) {
         Log.w(TAG, "onResume(): mAdapter not found");
         return;
     }

     int count = mAdapter.getCount();
     for (int i = 0; i < count; i++) {
         Header header = (Header) mAdapter.getItem(i);
         String name = null;
         if (header != null && header.extras != null
                 && (name = header.extras.getString(EXTRA_DEVICE_MODE)) != null) {
             HeaderViewHolder viewHolder = mAdapter.getHeaderViewHolder(i);
             if (viewHolder != null && viewHolder.switch_ != null) {
                 final CompoundButton button = viewHolder.switch_;
                 runOnUiThread(new Runnable() {
                     @Override
                     public void run() {
                     BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
                     // Do it only when there is no devie mode switch in progress
                     // and Device mode Button is disabled due to device mode switch
                      if ((!button.isEnabled()) && (isDeviceModeSwitchInProgress == false) )
                         button.setEnabled(true);
                     }
                 });
             }
         }
     }

    }


    public void onPause() {
     Log.d(TAG, "onPause");
        super.onPause();
    }

    @Override
    public void onBuildHeaders(List<Header> headers) {
        // Get a list of Bluetooth Profiles and add them
        ProfileCfg[] supportedProfileCfgs = ProfileConfig.getSupportedProfileCfgs();
        for (int i = 0; i < supportedProfileCfgs.length; i++) {
            ProfileCfg p = supportedProfileCfgs[i];
            try {
                if (p.mUserConfigurable && ((p.mDeviceModeCfg != ProfileConfig.CFG_MODE_DEVICE) &&
                (p.mDeviceModeCfg != ProfileConfig.CFG_MODE_TV))) {
                    Header h = new Header();
                    h.title = p.mDisplayName;
                    h.summary = p.mDescription;
                    h.extras = new Bundle();
                    h.extras.putString(EXTRA_PROFILE_NAME, p.mName);
                    h.fragment= ModeAdvancedSettings.class.getName();
                    headers.add(h);
                }
            } catch (Throwable t) {
                Log.w(TAG, "Error loading profile state: " + p.mName, t);
            }
        }

        // FIXME -- merge with existing framework
        mContext = this.getApplicationContext();
            Resources resources = mContext.getResources();
        String displayName = null;
        String deviceModesummary = null;
        int a2dpProfileDeviceMode = resources
                    .getInteger((Integer)R.integer.profile_cfg_run_in_device_mode_a2dp);
        int a2dpSinkProfileDeviceMode = resources
                    .getInteger((Integer)R.integer.profile_cfg_run_in_device_mode_a2dp_sink);

        int hfDeviceProfileDeviceMode = resources
                    .getInteger((Integer)R.integer.profile_cfg_run_in_device_mode_hfdevice);
        int headsetProfileDeviceMode = resources
                    .getInteger((Integer)R.integer.profile_cfg_run_in_device_mode_hs_hfp);


        if ((ProfileConfig.CFG_MODE_TV == a2dpProfileDeviceMode) &&
            (ProfileConfig.CFG_MODE_DEVICE == a2dpSinkProfileDeviceMode) &&
                (ProfileConfig.CFG_MODE_DEVICE == hfDeviceProfileDeviceMode) &&
                (ProfileConfig.CFG_MODE_TV == headsetProfileDeviceMode) &&
                (true == resources.getBoolean(R.bool.profile_supported_a2dp)) &&
                (true == resources.getBoolean(R.bool.profile_supported_hfdevice)))
            deviceModesummary = "AV-Src & HFP-AG when ON/ AVK & HFP-HF when OFF";
        else if ((ProfileConfig.CFG_MODE_TV == a2dpProfileDeviceMode) &&
                (ProfileConfig.CFG_MODE_DEVICE == a2dpSinkProfileDeviceMode) &&
                (true == resources.getBoolean(R.bool.profile_supported_a2dp)))
            deviceModesummary = "AV-Src when ON/ AVK when OFF";
        else if ((ProfileConfig.CFG_MODE_DEVICE == hfDeviceProfileDeviceMode) &&
                (ProfileConfig.CFG_MODE_TV == headsetProfileDeviceMode) &&
                (true == resources.getBoolean(R.bool.profile_supported_hfdevice)))
            deviceModesummary = "HFP-AG when ON/ HFP-HF when OFF";

        if(null == deviceModesummary)// Do not shown configurable option in Advanced Settings
            return;


        try {
            //resources.getString((Integer)MODE[0]);
            displayName = resources.getString(R.string.TV_mode);
            if (displayName == null)
                return;
            Header h = new Header();
            h.title = displayName;
            h.summary = deviceModesummary;
            h.extras = new Bundle();
            h.extras.putString(EXTRA_DEVICE_MODE, displayName);
            h.fragment=ModeAdvancedSettings.class.getName();
            headers.add(h);
        } catch (Throwable t) {
            Log.w(TAG, "Error loading :" + displayName );
        }
    }

    @Override
    public void setListAdapter(ListAdapter adapter) {
        if (adapter == null) {
            super.setListAdapter(null);
        } else {
            mAdapter = new AdvancedSettingsHeaderAdapter(this, getHeaders());
            mAdapter.setCheckedChangeListener(this);
            super.setListAdapter(mAdapter);
        }
    }

 public boolean setDeviceMode( String deviceModeName,boolean isChecked, int deviceMode) {
        saveDeviceModeSetting(deviceModeName, isChecked);
        AdapterService svc = AdapterService.getAdapterService();
        if (svc == null) {
            return false;
        }
        mContext = this.getApplicationContext();
        SharedPreferences.Editor editor = PreferenceManager.
            getDefaultSharedPreferences(mContext).edit();

        svc.setProfileStateChangeListener(this);

        Log.d(TAG,"BluetoothAdvancedSettings  mDeviceMode   " + deviceMode );
        editor.putInt("DEVICEMODE",deviceMode);
        editor.apply();
        isDeviceModeSwitchInProgress = true;

        return svc.setDeviceMode(deviceMode);
    }


     @Override
    public void onCheckedChanged(int position, boolean isChecked) {
        if (mAdapter == null) {
            Log.w(TAG, "mAdapter not found");
            return;

        }
        // Get the header
        Header header = (Header) mAdapter.getItem(position);
        if (header == null) {
            Log.w(TAG, "Header not found for position " + position);
            return;
        }
        Bundle b = header.extras;
        if (b == null) {
            Log.w(TAG, "Bundle not found for position " + position);
            return;
        }

        // fixme -- integrate into existing profile framework
        String deviceMode = b.getString(EXTRA_DEVICE_MODE);

        if (deviceMode != null)
        {
            HeaderViewHolder viewHolder = mAdapter.getHeaderViewHolder(position);
            if (viewHolder == null) {
                Log.w(TAG, "ViewHolder not found for position " + position);
                return;
            }
            final CompoundButton cpButton = viewHolder.switch_;
            if (cpButton == null) {
                Log.w(TAG, "Button not found for position " + position);
                return;
            }
            final TextView tv_title = viewHolder.title;
           if (tv_title == null) {
               Log.w(TAG, "Title not found for position " + position);
               return;
           }
            BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
            if(isChecked) {
                setDeviceMode(deviceMode,isChecked,mService.DEFAULT_MODE);
                tv_title.setClickable(false);
            //    BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
		btAdapter.setScanMode(BluetoothAdapter.SCAN_MODE_CONNECTABLE);
            } else {
                setDeviceMode(deviceMode,isChecked,mService.HEADSET_MODE);
                btAdapter.setDiscoverableTimeout(0);
		btAdapter.setScanMode(BluetoothAdapter.SCAN_MODE_CONNECTABLE_DISCOVERABLE,0);
                tv_title.setClickable(false);
           }
            cpButton.setEnabled(false);


            return;
        }

        String profileName = b.getString(EXTRA_PROFILE_NAME);
        if (profileName == null) {
            Log.w(TAG, "Profile name not found for position " + position);
            return;
        }

        Log.d(TAG, "onCheckChanged: profileName=" + profileName + ", isChecked=" + isChecked);
        HeaderViewHolder viewHolder = mAdapter.getHeaderViewHolder(position);
        if (viewHolder == null) {
            Log.w(TAG, "ViewHolder not found for position " + position);
            return;
        }
        Button button = viewHolder.switch_;
        if (button == null) {
            Log.w(TAG, "Button not found for position " + position);
            return;
        }
        button.setEnabled(false);
        setProfileState(profileName, isChecked);
    }

  /**
     * Save the  device mode  (DEFAULT or HEADSET)
     *
     * @param on
     * @return
     */
    public static void saveDeviceModeSetting(String deviceModeName, boolean enabled) {
        if (mContext != null) {
            ContentResolver cr = mContext.getContentResolver();
            Settings.Global.putInt(cr, SETTINGS_PREFIX + deviceModeName, enabled ? 1 : 0);
        }
    }
    //The default device mode displayed should be "TV".Content Resolver will be be NULL
    //initially.
    public static boolean isDeviceModeEnabled(String deviceModeName) {
        boolean ret = true;
        if (mContext != null) {
            ContentResolver cr = mContext.getContentResolver();
            try {
                Log.d(TAG, "getProfileSaveSetting: " + deviceModeName);
                if( Settings.Global.getInt(cr, SETTINGS_PREFIX + deviceModeName) != 1)
                    ret = false;
            } catch (Throwable t) {
                Log.d(TAG, "Unable to read settings", t);
            }
        }
        return ret;
    }

    @Override
    public void onDeviceModeSwitchComplete() {

        Log.w(TAG, "onDeviceModeSwitchComplete()");

        isDeviceModeSwitchInProgress = false;
        if (mAdapter == null) {
            Log.w(TAG, "onDeviceModeSwitchComplete(): mAdapter not found");
            return;
        }

        int count = mAdapter.getCount();
        for (int i = 0; i < count; i++) {
            Header header = (Header) mAdapter.getItem(i);
            String name = null;
            if (header != null && header.extras != null
                    && (name = header.extras.getString(EXTRA_DEVICE_MODE)) != null) {
                HeaderViewHolder viewHolder = mAdapter.getHeaderViewHolder(i);
                if (viewHolder != null && viewHolder.switch_ != null) {
                    final CompoundButton button = viewHolder.switch_;
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            button.setEnabled(true);
                            button.refreshDrawableState();
                            mAdapter.notifyDataSetChanged();
                        }
                    });
                }
            }
        }
    }

    @Override
    public void onProfileStateChanged(final String profileName, final int newState,
            final int oldState) {
        if (mAdapter == null) {
            Log.w(TAG, "onProfileStateChanged(): mAdapter not found");
            return;
        }
        int count = mAdapter.getCount();
        for (int i = 0; i < count; i++) {
            Header header = (Header) mAdapter.getItem(i);
            String name = null;
            if (header != null && header.extras != null
                    && (name = header.extras.getString(EXTRA_PROFILE_NAME)) != null
                    && name.equals(profileName)) {
                HeaderViewHolder viewHolder = mAdapter.getHeaderViewHolder(i);
                if (viewHolder != null && viewHolder.switch_ != null) {
                    final CompoundButton button = viewHolder.switch_;
                    runOnUiThread(new Runnable() {

                        @Override
                        public void run() {
                            boolean checked = (newState == BluetoothAdapter.STATE_ON);
                            if (checked != button.isChecked()) {
                                button.setOnCheckedChangeListener(null);
                                button.setChecked(checked);
                                button.setOnCheckedChangeListener(mAdapter);
                            }
                            button.setEnabled(true);
                        }
                    });
                }
            }
        }
    }
}
