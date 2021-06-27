#!/bin/bash

set -e

exec python3 ./api/etl_orsted.py &
exec python3 ./api/Rest_call.py.py