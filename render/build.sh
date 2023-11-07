set -o errexit

python -m pip install -r ./requirements.txt

python manage.py loaddata initProject.json
python manage.py collectstatic --no-input
python manage.py migrate codesoft zero

python manage.py makemigrations codesoft
python manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('proyectosic', 'proyectosic', 'proyectosic')" | python manage.py shell
