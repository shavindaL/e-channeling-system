document.getElementById("filter").addEventListener('input',changeFilterTag);

function changeFilterTag(){
    var filter=document.getElementById("filter").value
    document.getElementById("filter-search").innerHTML = filter;
    document.getElementById("filter-search-input").setAttribute("name", filter);
}