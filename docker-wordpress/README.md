# Docker wordpress

## Description:
Docker compose configuration for:
- Wordpress (latest)
- MySQL (5.7)
- phpMyAdmin


## Usage:


#### Configuration:

- [./config/uploads.ini](./config/uploads.ini): Server upload and post size  

- [.env](./.env) file:

| Key | Description |
| ------------- | ------------- |
| MYSQL_ROOT_PASSWORD | MySQL root password |
| MYSQL_DATABASE | Wordpress database  |
| MYSQL_USER | Wordpress database user  |
| MYSQL_PASSWORD | Wordpress database user password |
| WP_DB_HOST | MySQL host  |
| WP_PREFIX | Wordpress database table prefix |
| WP_PORT | External Wordpress ports |
| DB_PORT | External MySQL ports |
| PMA_PORT | External phpMyAdmin ports |


#### Init (run only once first!)
```bash
chmod +x ./init.sh && ./init.sh
```

#### Start docker stacks
```bash
docker-compose up
```

# Check:
- Wordpress => http://localhost:${WP_PORT in .env file}
- PhpMyAdmin => http://localhost:${PMA_PORT in .env file}
