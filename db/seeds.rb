# -*- encoding : utf-8 -*-
#создание администратора
u=User.new(:name=>"Администратор", :password=>"admin2", :password_confirmation=>"admin2", :email=>"admin@msiu.ru")
u.role=1
u.save
#создание стран
countries_file=File.new("countries.txt")
countries_file.each_line{|name| Country.create(name: name.strip)}
countries_file.close


#создание жанров
genre_names=%w(Боевик Вестерн Детектив Драма Комедия Комикс Мелодрама Мистика Мультфильм Политика Приключения Триллер Ужастик Фантастика Фэнтези)
genre_names.each do |name|
  Genre.create(:name=>name)
  puts "CREATED GENRE #{name}"
end

#создание персон
kameron=Person.create(:name=>"Джеймс Кэмерон", :origin_name=>"James Cameron", :birthday=>Date.parse("16.08.1954"), :male=>true)
schwarznegger=Person.create(:name=>"Арнольд Шварценеггер", :origin_name=>"Arnold Schwarzenegger", :birthday=>Date.parse("30.07.1947"), :male=>true)
hamilton=Person.create(:name=>"Линда Хэмилтон", :origin_name=>"Linda Hamilton", :birthday=>Date.parse("26.09.1956"), :male=>false)
dikaprio=Person.create(:name=>"Леонардо ДиКаприо", :origin_name=>"Leonardo DiCaprio", :birthday=>Date.parse("11.11.1974"), :male=>true)
uinslet=Person.create(:name=>"Кэйт Уинслет", :origin_name=>"Kate Winslet", :birthday=>Date.parse("05.11.1975"), :male=>false)

#создание фильмов
terminator=Film.new(:name=>"Терминатор 2: Судный день", :origin_name=>"Terminator 2: Judgment Day",
                       :slogan=>"Same Make. Same Model. New Mission.", :country=>Country.find_by_name("США"), :genre=>Genre.find_by_name("Боевик"),
                       :director=>kameron,:length=>137,:year=>1991,:trailer_url=>"oL1RE8JXaIw",:people=>[schwarznegger,hamilton])
terminator.description=<<DESC
Прошло более десяти лет с тех пор, как киборг-терминатор из 2029 года пытался уничтожить Сару Коннор — женщину, чей будущий сын выиграет войну человечества против машин.

Теперь у Сары родился сын Джон и время, когда он поведёт за собой выживших людей на борьбу с машинами, неумолимо приближается. Именно в этот момент из пост-апокалиптического будущего прибывает новый терминатор — практически неуязвимый и способный принимать любое обличие. Цель нового терминатора уже не Сара, а уничтожение молодого Джона Коннора.

Однако, шансы Джона на спасение существенно повышаются, когда на помощь приходит перепрограммированный сопротивлением терминатор предыдущего поколения. Оба киборга вступают в смертельный бой, от исхода которого зависит судьба человечества.
DESC
puts "TERMINATOR SAVED: #{terminator.save}"



titanic=Film.new(:name=>"Титаник", :origin_name=>"Titanic",
                       :slogan=>"Ничто на Земле не сможет разлучить их.", :country=>Country.find_by_name("США"), :genre=>Genre.find_by_name("Драма"),
                       :director=>kameron,:length=>194,:year=>1997,:trailer_url=>"zCy5WQ9S4c0",:people=>[dikaprio,uinslet])
titanic.description=<<DESC
Молодые влюбленные Джек и Роза находят друг друга в первом и последнем плавании «непотопляемого» Титаника. Они не могли знать, что шикарный лайнер столкнется с айсбергом в холодных водах Северной Атлантики, и их страстная любовь превратится в схватку со смертью…
DESC
puts "TITANIC SAVED: #{titanic.save}"
