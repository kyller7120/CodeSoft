set -o errexit

python -m pip install -r ./requirements.txt

python manage.py loaddata initProject.json
python manage.py collectstatic --no-input
python manage.py migrate codesoftapp zero

python manage.py makemigrations codesoftapp
python manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('proyecto', 'proyecto123', 'proyecto123')" | python manage.py shell
