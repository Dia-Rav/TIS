from sqlalchemy import create_engine, text, select

class film_data(object):
    def __init__(self):
        self._engine=create_engine("sqlite:///films.db", echo = True)

    def get_persons(self, film_id):
        sql = text("SELECT a.person_id as person_id, a.name as name, d.name as post from person as a \
join film_person as c on c.person_id = a.person_id \
join jobs as d on c.post_id = d.post_id \
where c.film_id = " + str (film_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append(dict(record))
        return ret

    def get_country_of_film(self, film_id):
        sql = text("SELECT a.name from country as a \
join film_country as c on c.country_id = a.id \
where c.film_id = " + str (film_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret

    def get_genre(self, film_id):
        sql = text("SELECT a.name from genre as a \
join film_genre as c on c.genre_id = a.id \
where c.film_id = " + str (film_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret
    def get_all_films(self):
        sql = text("SELECT film_id,name from film order by name")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append(dict(record))
        return ret

    def get_all_persons(self):
        sql = text("SELECT person_id, name from person order by name")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append(dict(record))
        return ret

    def get_country_of_person(self, person_id):
        sql = text("SELECT a.name from country as a \
join person_country as c on c.country_id = a.id \
where c.person_id = " + str (person_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret

    def get_persons_films(self, person_id):
        sql = text("SELECT a.film_id as film_id, b.name as name, c.name as post_name from film_person as a \
join film as b on b.film_id = a.film_id \
join jobs as c on c.post_id = a.post_id \
where a.person_id = " + str(person_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append(dict(record))
        return ret

    def get_persons_life(self, person_id):
        sql = text("SELECT a.person_id as person_id, name, a.birth_year as birth, b.year as death \
             from person as a left join death as b on b.person_id = a.person_id \
            where a.person_id = " + str(person_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append(dict(record))
        return ret[0]
    
    def get_person_name(self, person_id):
        sql = text("SELECT name from person where person_id = " + str(person_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret
    
    def get_film_name(self, film_id):
        sql = text("SELECT name from film where film_id = " + str(film_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret

    def get_film_date(self, film_id):
        sql = text("SELECT year from film where film_id = " + str(film_id) + ";")
        sql_result = self._engine.execute(sql)
        ret = []
        for record in sql_result:
            ret.append((record[0]))
        return ret

bd = film_data()
print (bd.get_persons_life(1))




