#!/bin/sh

BOT_URL="https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage"

PARSE_MODE="Markdown"

if [ $TRAVIS_TEST_RESULT -ne 0 ]; then
    build_status="failed"
else
    build_status="passed"
fi

send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=259198083 \
        -d text="$1" -d parse_mode=${PARSE_MODE} -d disable_web_page_preview=True
}

send_msg "
Build [#$TRAVIS_BUILD_NUMBER]($TRAVIS_BUILD_WEB_URL) ([$TRAVIS_COMMIT](https://github.com/$TRAVIS_REPO_SLUG/$TRAVIS_COMMIT)) of $TRAVIS_REPO_SLUG@$TRAVIS_PULL_REQUEST_BRANCH $TRAVIS_TEST_RESULT. [CHECK IT OUT](https://uetuluk.github.io/test-frontend/)
[Job Log here](${TRAVIS_JOB_WEB_URL})
"
