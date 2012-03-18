tokenInputOptions = {crossDomain: false, hintText: "Введите имя", noResultText: "Ничего не найдено", searchingText: "Поиск", preventDuplicates: true}
$ ->
  $("input#film_person_tokens").tokenInput(window.people_path,$.extend({},tokenInputOptions,{prePopulate: $(this).attr('data-pre')}))
  $("input#film_director_id").tokenInput(window.people_path,$.extend({},tokenInputOptions,{tokenLimit: 1,prePopulate: $(this).attr('data-pre')}))