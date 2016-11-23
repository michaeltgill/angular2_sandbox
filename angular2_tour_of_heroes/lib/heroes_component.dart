import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'heroes_component.html',
  styleUrls: const ['heroes_component.css']
)
class HeroesComponent implements OnInit {
  Hero selectedHero;
  List<Hero> heroes;
  final HeroService _heroService;
  final Router _router;

  HeroesComponent(this._heroService, this._router);

  void ngOnInit() {
    getHeroes();
  }

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  onSelect(Hero hero) {
    selectedHero = hero;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'HeroDetail',
    {'id': selectedHero.id.toString()}
  ]);
}