#!/bin/bash

if [ "${CIRCLE_PROJECT_USERNAME}" == "${OWNER}" ]; then
    yarn semantic-release || true
fi
