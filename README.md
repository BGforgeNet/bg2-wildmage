# Wild Mage additions mod for Baldur's Gate 2
<a href="https://tra.bgforge.net/projects/infinity-engine/wild-mage-additions/">
<img src="https://tra.bgforge.net/widgets/infinity-engine/-/wild-mage-additions/svg-badge.svg" alt="Translation status" />
</a>
<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">
<img src="https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue.svg" alt="License" />
</a>

[__Download__](https://github.com/burner1024/bg2-wildmage/releases/latest)
 | [__Support__](#support)
 | [__Discussion__](https://forum.bgforge.net/viewtopic.php?f=4&t=17)
 | [__Help translating__](https://tra.bgforge.net/projects/infinity-engine/wild-mage-additions/)

This mod expands on Wild Magic and Wild Mages. Fixed version, based on [original by JOG](http://mods.jo-ge.net/bg/shaper.htm).

**Work in progress**.

- Components
  - [New wild magic spells](#new-wild-magic-spells)
  - [Retain Rhialto's inventory](#retain-rhialtos-inventory)
  - [Spellshaper kit](#spellshaper-kit)
  - [Misc spell changes](#misc-spell-changes)
- [Tips](#tips)
- [Changelog](#changelog)
- [License](#license)

### New wild magic spells
- [Ironman](#ironman)
- [Haugthy pansy](#haugthy-pansy)

This component features 27 new wild magic spells and an unique cast-once spell. See [SPELLS.PDF](wildmage/docs/spells.pdf) for detailed description.

You will meet a wild mage and gain access to his spellbook, from which you will be able to learn one spell per level of experience. If there are no wild mages in your party then the mod ends at this point. You can sell the spellbook - only wild mages can use it.

#### Ironman
On Ironman, to meet the mage, rest outdoors. You can also rest in an inn and leave the inn right thereafter.

#### Haugthy pansy
On haugthy pansy (available in BG1 only), the mage will be waiting outside Candlekeep's walls.

### Retain Rhialto's inventory
Certain items are available to the player only if Rhialto is killed fast enough. This component removes that restriction and lets you have all the loot.

### Spellshaper kit
- [Original avatar](#original-avatar)
- [Changed avatar](#changed-avatar)

A Spellshaper can't rely as much on his magic as a wizard - his spellcasting abilities are comparable to those of a bard, and his spellweaving ability might backfire. He has a wide selection of spells (some of them not even accessible to a wizard or standard wild mage) but can't cast them very often. In exchange the Spellshaper has combat abilities comparable to a rogue, and more often than not solves "problems" by mundane means, saving his magic as a last-resort tool.

All in all, the spellshaper is a heedless opportunist, to whom magic is a powerful but unreliable tool - no more and no less valuable than a good melee weapon. Imagine Elric fighting with two daggers instead of a great sword and you know the base concept of the Spellshaper class. See [SPELLSHAPER.PDF](wildmage/docs/spellshaper.pdf) for more details.

There are two ways to become a Spellshaper:

1. When the protagonist is a non-lawful Wild Mage, he'll have the chance to become a Spellshaper in the midst of combat, when he gets badly hurt.
2. Lawful protagonists and other party members need to study Rhialto's spellbook. One of the spells - "Rhialto's Chaos Conduit" forces the same changes upon the caster, that happen spontaneously to a non-lawful protagonist.

The Spellshaper is meant to be a kind of "rogueish" mage (or a "magey" rogue) as opposed to the standard "robe & pointy hat" fantasy wizard. The mage-avatar isn't fitting for this character (at least not for the Spellshaper I'm playing). So, you have an option to change it:

#### Original avatar
The Spellshaper will look like a regular mage.
#### Changed avatar
- Female Spellshapers use the Thief avatar
- Male Spellshapers use the Cleric avatar

### Misc spell changes

This component is independent of the other components, and modifies some of the original spells:

#### Magic Missiles
The missiles now always do 1d4+1 points of damage, as they're supposed to. Originally it was 2d2 at level 3-8 and 2d2+1 at levels 1,2 and 9+.

#### Dimension Door
Like dozens of other wizards in the game, you now can target any nearby place you've already visited. There no longer needs to be a clear path within the caster's viewing distance that leads to the destination-area. You can select any place within the area where you've been already. (This component doesn't include scrolls to learn the spell, if you don't play a spellshaper you need another mod, or use Shadowkeeper to learn the spell or get the scroll).

### Tips
- Rhialto will always spawn. It doesn't matter which class is the main character.
- How to kill him on low levels, (BG1 ironman):
  - gather a larger party
  - spread, run, shoot
- In pansy mode, Rhialto is in the actual Candlekeep area, not in the area where Gorion is killed.

### Support
- Check known issues below.
- Check [reported issues](https://github.com/BGforgeNet/bg2-wildmage/issues?utf8=%E2%9C%93&q=is%3Aissue)
- If it's not present there, file a new one.

#### Not bugs/known issues
- "Summon Cow" occasionally damages every creature in the whole area. This seems to be hard-coded and intended by Bioware. It also happens with the wild surge and the original 2nd level "Easter Egg"-spell.
- Spellshaper *does not* get extra attacks from weapon specialization. If you're unhappy with that, post [here](https://github.com/BGforgeNet/bg2-wildmage/issues/2)
- "Weave Spell" acts a bit strange with wizard spells from other mods: as long as you still have original Bioware-spells or spells from this mod memorized, using "Weave Spell" will drain the modded spells from memory just like the others, but when there are only modded spells memorized, you can't use the "Weave Spell" ability.
- Items that raise the number of Spell-Slots, when worn by a Spellshaper, might cause him to forget all spells of tbe modified level upon resting. This seems to be an engine-glitch, and I have no idea how to fix it. The solution is simply NOT to wear such items (they definitely don't work for a Spellshaper)
- When a Spellshaper is level-drained, he may get bonus-spell-slots, when the game resets his number of spells. Once he is restored to the old level, the number of spells is also restored. The only way to "fix" this seems to grant the Spellshaper permanent immunity to level-drain...
- Right after a Spellshaper advanced to 20th level, he is stunned for a second. This happens on purpose, to prevent you from equipping a Ring of Wizardry while the "Hand"-item (which normally prevents you from using Metamagic items) is exchanged in order to actualize the char's number of memorizable spells.

### Changelog
- 2.beta3
  - Better EE compatibility with HANDLE_CHARSETS
  - Updated some translations
- 2.beta2
  - Fixed problem with Rhialto never polymorphing
  - Added separate component to preserve the bear
  - Fix tutu installation
- 2.beta1
  - Allow to be installed on EE (including IWD:EE)
  - Make MacOS/Linux friendly
  - Combine some components to simplify installation
  - Preserve teddy bear upon BG1>BG2 transition
  - Fix Rodent/Ratatosk shape: power, dispell/bypass, AC bonus, paw enchantment, description
  - Fix Random spell X description
  - Fix Rhialto's spell slots/levels
  - Fix Blade shower: no permanent daggers, bypass magic protections such as GoI, clarify description, disable wild surges/spell failure for created daggers
  - Under the hood: dos2unix, lowercase, split components into multiple files, use newer weidu syntax, shorten where possible, streamline scripts handling Rhialto appearance and items transfer
- 1.7: the original


### License
The original work is abandonware. JOG doesn't appear to be available.

Contributions on top of the original are [CC BY-NC-SA v4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
