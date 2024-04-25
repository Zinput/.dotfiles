#!/bin/bash
curl -sS https://am.i.mullvad.net/connected | grep -q 'You are connected to Mullvad' \
&& echo '{"text":"VPN Connected","class":"connected","percentage":100}' \
|| echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
