#!/bin/sh -e

cp -rf $SNAP/hacs $SNAP_DATA/custom_components/hacs
echo "Copyied data to Home Assistant:"
echo "From:     $SNAP/hacs -"
echo "To:       $SNAP_DATA/custom_components/hacs"
