class EventData {
  String imageAsset;
  String nama;
  String tanggal;
  String tags;
  String caption;

  EventData({
    required this.imageAsset,
    required this.nama,
    required this.tanggal,
    required this.tags,
    required this.caption
  });
}

var eventList = [
  EventData(
    imageAsset: 'images/lomba.jpg',
    nama: 'Lomba',
    tanggal: '29 Sept 2021',
    tags: '#competition',
    caption: 'Dalam perlombaan diwajibkan datang tepat waktu, anda harus datang'
        'lebih awal daripada waktu penentuan. Keputusan juri tidak dapat diganggu gugat'
        'dan adalah keputusan mutlak',
  ),
  EventData(
    imageAsset: 'images/masak.jpg',
    nama: 'Masak',
    tanggal: '28-9-2000',
    tags: '#nutricia',
    caption: 'Dalam lomba masak ini anda diwajibkan datang supaya menang.'
        'Anda bawa peralatan sendiri, tidak diijinkan mencontek resep.'
        'Perlombaan diadakan dengan ketat',
  ),
  EventData(
    imageAsset: 'images/party.jpg',
    nama: 'party',
    tanggal: '27-9-2000',
    tags: '#fun',
    caption: 'Syarat dan ketentuan pesta adalah dilarang membawa minuman keras, '
        'dilarang merokok, dilarang membawa senjata tajam',
  ),
  EventData(
    imageAsset: 'images/rapat.jpg',
    nama: 'rapat',
    tanggal: '26-9-2000',
    tags: '#focus',
    caption: 'Peraturan rapat adalah dengarkan yang bicara, angkat tangan sebelum bertanya,'
        'simpan gadget dulu',
  ),
];
