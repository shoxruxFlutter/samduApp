class BasicTile{
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({
    required this.title,
    this.tiles = const[],
  });
}

final basicTiles = <BasicTile>[

  const BasicTile(
    title: "Professor o'qituvchilar",
    tiles: [
      BasicTile(
        title: 'Yuklamalar',
        tiles: [
          BasicTile(title: "O'quv predmetlari"),
          BasicTile(title: "Adabiyotlar ro'yxati"),
          BasicTile(title: "Kutubxona/Internet"),
        ],
      ),
      BasicTile(
        title: "O'qituvchilarning ilmiy-uslubiy yuklamalari",
        tiles: [
          BasicTile(title: '....'),
          BasicTile(title: '....'),
        ],
      ),
    ]
  )
];