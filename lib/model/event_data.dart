class EventData {
  String imageAsset;
  String nama;
  String tanggal;

  EventData({
    required this.imageAsset,
    required this.nama,
    required this.tanggal,
  });
}

var eventList = [
  EventData(
    imageAsset: 'images/lomba.jpg',
    nama: 'Lomba',
    tanggal: '29 Sept 2021',
  ),
  EventData(
    imageAsset: 'images/masak.jpg',
    nama: 'Masak',
    tanggal: '28-9-2000',
  ),
  EventData(
    imageAsset: 'images/party.jpg',
    nama: 'party',
    tanggal: '27-9-2000',
  ),
  EventData(
    imageAsset: 'images/rapat.jpg',
    nama: 'rapat',
    tanggal: '26-9-2000',
  ),
];
