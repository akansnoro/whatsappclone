class Chatcon {
  final String name;
  final String message;
  final String image;
  final String time;
  final String count;
Chatcon({
  required this.name,
  required this.message,
  required this.image,
  required this.time,
  this.count = "",
});
}
 List<Chatcon> chatList = [
  Chatcon(name: "Jane Smith", message: "see you later", image: 'asset/img/images1.png', time: "9:41AM", count: "2"),
  Chatcon(name: "Family Group", message: "Mom:Dinner at 7", image: 'asset/img/images2.jpg', time: "9:30AM", count: "5"),
  Chatcon(name: "Besties", message: "Mike:😂😂", image: 'asset/img/rrr.jpg', time: "9:18AM", count: "1"),
  Chatcon(name: "Work Team", message: "You:Project update", image: 'asset/img/nnn.jpg', time: "8:50AM"),
  Chatcon(name: "Emily Johnson", message: "Thanks!", image: 'asset/img/eee.jpg', time: "Yesterday"),
];