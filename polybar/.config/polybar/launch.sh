#!/usr/bin/env bash

#!/bin/bash
killall -q polybar
#!/usr/bin/env bash


echo "---" | tee -a /tmp/polybar.log
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
