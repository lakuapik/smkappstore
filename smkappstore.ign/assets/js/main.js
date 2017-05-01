var dataApp;

$(document).ready(function(){
  //mengambil data dari db/db.json dan dibuat variable dataApp
  $.getJSON( "assets/db/db.json", function( data ) {
    dataApp = data.dataApp;
    getRandomApp();
  });
});

function getRandomApp(){
  for(var i = 1; i <= 10; i++){
    var idApp = dataApp[Math.floor(Math.random()*dataApp.length)].id;
    var html = '\
    <div class="col-md-3 portfolio-item"> \
      <a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+idApp+')" data-target="#modalApp"><img class="img-responsive" src="assets/img/app/'+dataApp[idApp].nick+'.png" style="width:250px;height:250px;" alt="Icon"></a> \
      <h3><a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+idApp+')" data-target="#modalApp">'+dataApp[idApp].name+'</a></h3> \
      <p style="text-align:justify">'+(dataApp[idApp].desc).split('.')[0]+'. <a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+idApp+')" data-target="#modalApp">Lebih lanjut...</a></p> \
    </div> \
    ';
    $('#aplikasi').append(html);
    if( i % 4 == 0){
      $('#aplikasi').append('<h1>.</h1>');
    }
  }
}

function modalApp(id){
  var html = '\
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
    <h4><strong>'+dataApp[id].name+'</strong></h4><br> \
    <p style="align:justify">'+dataApp[id].desc+'</p> \
    <hr/> \
    <h5>Gambar:</h5> \
    <div style="width:100%"> \
      <img id="ss1" class="imgss" src="assets/img/app/'+dataApp[id].nick+'.ss1.png" alt="SS1"> \
      <img id="ss2" class="imgss" src="assets/img/app/'+dataApp[id].nick+'.ss2.png" alt="SS2"> \
      <div style="clear:both"></div> \
    </div> \
    <hr/> \
    <button id="button-install" type="button" class="btn btn-primary" onclick="pasangApp(\''+dataApp[id].nick+'\')" style="width:100%">Pasang</button> \
  ';
  $("#apps_detail").html(html);
}

function jurusanApp(jurusan){
  $('#head-jurusan').html(jurusan.toUpperCase());
  var namajur = jurusanApa(jurusan);
  $('#low-jurusan').html('<small>'+namajur+'</small>');
  var appjur = findByKey(dataApp, 'kat', jurusan);
  //$('#aplikasi').html('<span class="info">memproses data...</span>');

  $('#aplikasi').html('');
  if(appjur.length == 0){
    $('#aplikasi').append('<p class="bg-danger">Belum ada data, akan di perbarui secepatnya :)</p>');
  }
  else{
    for(var i = 0; i <= appjur.length; i++){
      var html = '\
      <div class="col-sm-3 portfolio-item"> \
        <a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+(appjur[i].id-1)+')" data-target="#modalApp"><img class="img-responsive" src="assets/img/app/'+appjur[i].nick+'.png" style="width:100%;height:100%;" alt="Icon"></a> \
        <h3><a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+(appjur[i].id-1)+')" data-target="#modalApp">'+appjur[i].name+'</a></h3> \
        <p style="text-align:justify">'+(appjur[i].desc).split('.')[0]+'. <a href="javascript:void(0)" data-toggle="modal" onclick="modalApp('+(appjur[i].id-1)+')" data-target="#modalApp">Lebih lanjut...</a></p> \
      </div> \
      ';
      $('#aplikasi').append(html);
      if( (i+1) % 4 == 0){
        $('#aplikasi').append('<h1>.</h1>');
      }
    }
  }
}

function jurusanApa(jur){
  var jurusan;
  switch (jur) {
    case "tkj":
      jurusan = "Teknik Komputer Jaringan";
      break;
    case "tgb":
      jurusan = "Teknik Gambar Bangunan";
      break;
    case "tkbb":
      jurusan = "Teknik Konstruksi Batu Beton";
      break;
    case "tei":
      jurusan = "Teknik Elektronika Industri";
      break;
    case "tav":
      jurusan = "Teknik Audio Video";
      break;
    case "tiptl":
      jurusan = "Teknik Instalasi Pemanfaatan Tenaga Listrik";
      break;
    case "tme":
      jurusan = "Teknik Mekatronika";
      break;
    case "tp":
      jurusan = "Teknik Pemesinan";
      break;
    case "tkr":
      jurusan = "Teknik Kendaraan Ringan";
      break;
    default:
  }
  return jurusan;
}

function pasangApp(nick){
  var sys = ign.sys();
  sys.exec('gksudo /opt/smkappstore/main.py '+nick+'');
  //sys.exec('firefox');
}

//http://stackoverflow.com/questions/43171098/javascript-how-to-get-select-all-object-with-same-keys
function findByKey(object, key, value) {
  var result = [];
  for (i = 0; i < object.length; i++) {
    var element = object[i];
    if (element[key] === value) {
      result.push(element);
    }
  }
  return result;
}
