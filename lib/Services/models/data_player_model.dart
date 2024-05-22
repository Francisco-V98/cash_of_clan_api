// To parse this JSON data, do
//
//     final getDataPlayerModel = getDataPlayerModelFromJson(jsonString);

import 'dart:convert';

GetDataPlayerModel getDataPlayerModelFromJson(String str) => GetDataPlayerModel.fromJson(json.decode(str));

String getDataPlayerModelToJson(GetDataPlayerModel data) => json.encode(data.toJson());

class GetDataPlayerModel {
    final String? tag;
    final String? name;
    final int? townHallLevel;
    final int? expLevel;
    final int? trophies;
    final int? bestTrophies;
    final int? warStars;
    final int? attackWins;
    final int? defenseWins;
    final int? builderHallLevel;
    final int? builderBaseTrophies;
    final int? bestBuilderBaseTrophies;
    final String? role;
    final String? warPreference;
    final int? donations;
    final int? donationsReceived;
    final int? clanCapitalContributions;
    final Clan? clan;
    final BuilderBaseLeague? builderBaseLeague;
    final List<Achievement>? achievements;
    final PlayerHouse? playerHouse;
    final List<dynamic>? labels;
    final List<HeroEquipment>? troops;
    final List<HeroEquipment>? heroes;
    final List<HeroEquipment>? heroEquipment;
    final List<HeroEquipment>? spells;

    GetDataPlayerModel({
        this.tag,
        this.name,
        this.townHallLevel,
        this.expLevel,
        this.trophies,
        this.bestTrophies,
        this.warStars,
        this.attackWins,
        this.defenseWins,
        this.builderHallLevel,
        this.builderBaseTrophies,
        this.bestBuilderBaseTrophies,
        this.role,
        this.warPreference,
        this.donations,
        this.donationsReceived,
        this.clanCapitalContributions,
        this.clan,
        this.builderBaseLeague,
        this.achievements,
        this.playerHouse,
        this.labels,
        this.troops,
        this.heroes,
        this.heroEquipment,
        this.spells,
    });

    factory GetDataPlayerModel.fromJson(Map<String, dynamic> json) => GetDataPlayerModel(
        tag: json["tag"],
        name: json["name"],
        townHallLevel: json["townHallLevel"],
        expLevel: json["expLevel"],
        trophies: json["trophies"],
        bestTrophies: json["bestTrophies"],
        warStars: json["warStars"],
        attackWins: json["attackWins"],
        defenseWins: json["defenseWins"],
        builderHallLevel: json["builderHallLevel"],
        builderBaseTrophies: json["builderBaseTrophies"],
        bestBuilderBaseTrophies: json["bestBuilderBaseTrophies"],
        role: json["role"],
        warPreference: json["warPreference"],
        donations: json["donations"],
        donationsReceived: json["donationsReceived"],
        clanCapitalContributions: json["clanCapitalContributions"],
        clan: json["clan"] == null ? null : Clan.fromJson(json["clan"]),
        builderBaseLeague: json["builderBaseLeague"] == null ? null : BuilderBaseLeague.fromJson(json["builderBaseLeague"]),
        achievements: json["achievements"] == null ? [] : List<Achievement>.from(json["achievements"]!.map((x) => Achievement.fromJson(x))),
        playerHouse: json["playerHouse"] == null ? null : PlayerHouse.fromJson(json["playerHouse"]),
        labels: json["labels"] == null ? [] : List<dynamic>.from(json["labels"]!.map((x) => x)),
        troops: json["troops"] == null ? [] : List<HeroEquipment>.from(json["troops"]!.map((x) => HeroEquipment.fromJson(x))),
        heroes: json["heroes"] == null ? [] : List<HeroEquipment>.from(json["heroes"]!.map((x) => HeroEquipment.fromJson(x))),
        heroEquipment: json["heroEquipment"] == null ? [] : List<HeroEquipment>.from(json["heroEquipment"]!.map((x) => HeroEquipment.fromJson(x))),
        spells: json["spells"] == null ? [] : List<HeroEquipment>.from(json["spells"]!.map((x) => HeroEquipment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tag": tag,
        "name": name,
        "townHallLevel": townHallLevel,
        "expLevel": expLevel,
        "trophies": trophies,
        "bestTrophies": bestTrophies,
        "warStars": warStars,
        "attackWins": attackWins,
        "defenseWins": defenseWins,
        "builderHallLevel": builderHallLevel,
        "builderBaseTrophies": builderBaseTrophies,
        "bestBuilderBaseTrophies": bestBuilderBaseTrophies,
        "role": role,
        "warPreference": warPreference,
        "donations": donations,
        "donationsReceived": donationsReceived,
        "clanCapitalContributions": clanCapitalContributions,
        "clan": clan?.toJson(),
        "builderBaseLeague": builderBaseLeague?.toJson(),
        "achievements": achievements == null ? [] : List<dynamic>.from(achievements!.map((x) => x.toJson())),
        "playerHouse": playerHouse?.toJson(),
        "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
        "troops": troops == null ? [] : List<dynamic>.from(troops!.map((x) => x.toJson())),
        "heroes": heroes == null ? [] : List<dynamic>.from(heroes!.map((x) => x.toJson())),
        "heroEquipment": heroEquipment == null ? [] : List<dynamic>.from(heroEquipment!.map((x) => x.toJson())),
        "spells": spells == null ? [] : List<dynamic>.from(spells!.map((x) => x.toJson())),
    };
}

class Achievement {
    final String? name;
    final int? stars;
    final int? value;
    final int? target;
    final String? info;
    final String? completionInfo;
    final Village? village;

    Achievement({
        this.name,
        this.stars,
        this.value,
        this.target,
        this.info,
        this.completionInfo,
        this.village,
    });

    factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        name: json["name"],
        stars: json["stars"],
        value: json["value"],
        target: json["target"],
        info: json["info"],
        completionInfo: json["completionInfo"],
        village: villageValues.map[json["village"]]!,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "stars": stars,
        "value": value,
        "target": target,
        "info": info,
        "completionInfo": completionInfo,
        "village": villageValues.reverse[village],
    };
}

enum Village {
    BUILDER_BASE,
    CLAN_CAPITAL,
    HOME
}

final villageValues = EnumValues({
    "builderBase": Village.BUILDER_BASE,
    "clanCapital": Village.CLAN_CAPITAL,
    "home": Village.HOME
});

class BuilderBaseLeague {
    final int? id;
    final String? name;

    BuilderBaseLeague({
        this.id,
        this.name,
    });

    factory BuilderBaseLeague.fromJson(Map<String, dynamic> json) => BuilderBaseLeague(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Clan {
    final String? tag;
    final String? name;
    final int? clanLevel;
    final BadgeUrls? badgeUrls;

    Clan({
        this.tag,
        this.name,
        this.clanLevel,
        this.badgeUrls,
    });

    factory Clan.fromJson(Map<String, dynamic> json) => Clan(
        tag: json["tag"],
        name: json["name"],
        clanLevel: json["clanLevel"],
        badgeUrls: json["badgeUrls"] == null ? null : BadgeUrls.fromJson(json["badgeUrls"]),
    );

    Map<String, dynamic> toJson() => {
        "tag": tag,
        "name": name,
        "clanLevel": clanLevel,
        "badgeUrls": badgeUrls?.toJson(),
    };
}

class BadgeUrls {
    final String? small;
    final String? large;
    final String? medium;

    BadgeUrls({
        this.small,
        this.large,
        this.medium,
    });

    factory BadgeUrls.fromJson(Map<String, dynamic> json) => BadgeUrls(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
    };
}

class HeroEquipment {
    final String? name;
    final int? level;
    final int? maxLevel;
    final Village? village;
    final List<HeroEquipment>? equipment;

    HeroEquipment({
        this.name,
        this.level,
        this.maxLevel,
        this.village,
        this.equipment,
    });

    factory HeroEquipment.fromJson(Map<String, dynamic> json) => HeroEquipment(
        name: json["name"],
        level: json["level"],
        maxLevel: json["maxLevel"],
        village: villageValues.map[json["village"]]!,
        equipment: json["equipment"] == null ? [] : List<HeroEquipment>.from(json["equipment"]!.map((x) => HeroEquipment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "level": level,
        "maxLevel": maxLevel,
        "village": villageValues.reverse[village],
        "equipment": equipment == null ? [] : List<dynamic>.from(equipment!.map((x) => x.toJson())),
    };
}

class PlayerHouse {
    final List<Element>? elements;

    PlayerHouse({
        this.elements,
    });

    factory PlayerHouse.fromJson(Map<String, dynamic> json) => PlayerHouse(
        elements: json["elements"] == null ? [] : List<Element>.from(json["elements"]!.map((x) => Element.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "elements": elements == null ? [] : List<dynamic>.from(elements!.map((x) => x.toJson())),
    };
}

class Element {
    final String? type;
    final int? id;

    Element({
        this.type,
        this.id,
    });

    factory Element.fromJson(Map<String, dynamic> json) => Element(
        type: json["type"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
