#Install postgres
sudo apt-get install -y postgresql postgresql-contrib libpq-dev

# Symlink into home.
# Note the use of backticks, PWD, and the -t flag.
ln -sf `ls $PWD/.pgpass` -t $HOME
chmod 600 $HOME"/.pgpass"

# Extract variables from the .pgpass file
# stackoverflow.com/a/5257398
# goo.gl/X51Mwz
PGPASS=`cat .pgpass`
TOKS=(${PGPASS//:/ })
PG_HOST=${TOKS[0]}
PG_PORT=${TOKS[1]}
PG_DB=${TOKS[2]}
PG_USER=${TOKS[3]}
PG_PASS=${TOKS[4]}

echo -e "\n\nINPUT THE FOLLOWING PASSWORD BELOW: "${PG_PASS}
sudo -u postgres createuser -U postgres -E -P -s $PG_USER
#sudo -u postgres createdb -U postgres -O $PG_USER $PG_DB
