
#!/bin/bash


# Enironment variables
ENV_FILE=./.env
CONFIG_FILE_SAMPLE=./config/wp-config-sample.php
CONFIG_FILE=./config/wp-config.php
APP_DIR=./wp-app/
DATA_DIR=./wp-data/


install_wp() {
    echo "Download wordpress:"

    mkdir -p $APP_DIR
    mkdir -p $DATA_DIR

    if [ -n "$(find "$APP_DIR" -maxdepth 0 -type d -empty 2>/dev/null)" ]; then
        echo "- Download latest"
        wget  -q --show-progress http://wordpress.org/latest.tar.gz

        echo "- Extract in ${APP_DIR}"
        tar xfz latest.tar.gz
        mv ./wordpress/* $APP_DIR

        echo "- Remove temp files"
        rm -rf wordpress
        rm latest.tar.gz
    else
        echo "- Warning: ${APP_DIR} is not empty. Skip..."
    fi

}

config_wp() {
    echo "Configure wordpress:"

    echo "- Create ${CONFIG_FILE} from sample"
    if [ -f ${CONFIG_FILE} ] ; then
        rm ${CONFIG_FILE}
    fi
    cp ${CONFIG_FILE_SAMPLE} ${CONFIG_FILE}

    echo "- Add base configuration"
    while read line || [[ -n $line ]]; do
        KEY=`echo $line | cut -s -d'=' -f1`
        if [ -n "$KEY" ]; then
            VAL=`echo $line | cut -d'=' -f2-`
            sed -i '' "/${KEY}/ s/${KEY}/${VAL}/" $CONFIG_FILE
        fi
    done < $ENV_FILE

    echo "- Add authentication unique keys and salts"
    SALT=$(wget -qO- https://api.wordpress.org/secret-key/1.1/salt/)
    STRING='$WORDPRESS_SALT;'
    printf '%s\n' "g/${STRING}/d" a "${SALT}" . w | ed -s $CONFIG_FILE

    echo "- Copy ${CONFIG_FILE} to ${APP_DIR}"
    cp $CONFIG_FILE $APP_DIR
}

install_wp
config_wp