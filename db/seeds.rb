Category.create([
  {:name=>'Грузовики'},
  {:name=>'Экскаваторы'},
  {:name=>'Тракторы'},
  {:name=>'Манипуляторы'}
])

User.create([
  {:name=>'Дядя Вася', :phone => '89603117679'},
  {:name=>'ООО СтройРемонтМонтаж', :phone => '89603117649'}
])

Machine.create([
  {:category => Category.first, :user => User.first, :name => 'Т100', :location => 'Чебоксары', :charge => 800},
  {:category => Category.first, :user => User.last, :name => 'Кировец', :location => 'Чебоксары', :charge => 200},
  {:category => Category.first(2).last, :user => User.first, :name => 'Урал', :location => 'Чебоксары', :charge => 500},
  {:category => Category.first(3).last, :user => User.last, :name => 'Братиша', :location => 'Чебоксары', :charge => 100},
  {:category => Category.first(4).last, :user => User.first, :name => 'М-300', :location => 'Чебоксары', :charge => 400}
])