#!/usr/bin/env bash
REPO="rodber/chevereto-free"
get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" |
        grep '"tag_name":' |
        sed -E 's/.*"([^"]+)".*/\1/'
}
latest=$(get_latest_release $REPO)
curl -S -o chevereto-free.zip -L \
    "https://github.com//$REPO/releases/latest/download/$latest.zip"
unzip chevereto-free.zip -d $WORKING_DIR &&
    rm -rf chevereto-free.zip
# Settings
cat >"$WORKING_DIR/app/settings.php" <<EOM
<?php
\$settings['db_host'] = getenv('CHEVERETO_DB_HOST');
\$settings['db_port'] = (int) getenv('CHEVERETO_DB_PORT');
\$settings['db_name'] = getenv('CHEVERETO_DB_NAME');
\$settings['db_user'] = getenv('CHEVERETO_DB_USER');
\$settings['db_pass'] = getenv('CHEVERETO_DB_PASS');
\$settings['db_table_prefix'] = 'chv_';
\$settings['db_driver'] = 'mysql';
\$settings['db_pdo_attrs'] = [];
\$settings['debug_level'] = 1;
EOM
chown www-data: $WORKING_DIR -R
