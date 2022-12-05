from flask import Flask, render_template
from connecting_bd import film_data

app = Flask(__name__)
bd = film_data()

@app.route("/persons")
def persons():
    """Обрабатывает запрос к странице со списком авторов http://mipt-space-tis.ru:5015/ """
    persons_list = bd.get_all_persons()
    ret = render_template("persons.html",persons_list=persons_list)
    return ret

@app.route("/person/<person_id>")
def person(person_id=None):
    """Обрабатывает запрос к странице конретного автора http://mipt-space-tis.ru:5015/person """
    person_name = bd.get_person_name(person_id)
    countries = bd.get_country_of_person(person_id)
    job = bd.get_persons_films(person_id)
    life = bd.get_persons_life(person_id)
    ret = render_template("person.html", person_name = person_name, countries = countries, films = job, life = life)
#ret ="<pre>" + str(author_name) +"\n" + str(countries) + "\n" + str(books) + "</pre>"
    return ret

@app.route("/films")
def films():
    films_list = bd.get_all_films()
    ret = render_template("films.html",films_list=films_list)
    return ret

@app.route("/")
def start():
    ret = render_template("start.html")
    return ret


@app.route("/film/<film_id>")
def film(film_id=None):
    film_name = bd.get_film_name(film_id)
    film_date = bd.get_film_date(film_id)
    genres = bd.get_genre(film_id)
    countries = bd.get_country_of_film(film_id)
    person_list = bd.get_persons(film_id)
    ret = render_template("film.html", countries = countries, year = film_date, 
    person_list = person_list, genres = genres)
    return ret
app.run(host='0.0.0.0',port=5015)
