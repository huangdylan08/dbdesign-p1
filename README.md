Project Name: Genshin Impact Database (temp) <br/>
Team Number: 26 <br/>
Team Members: Dylan Huang, Trevor Lau <br/>
Project Description: We are modeling a role playing game named Genshin Impact. In the game, the player collects and levels up characters and weapons who each have different abilities/types. <br/>
UML Diagram Link: https://github.com/huangdylan08/dbdesign-p1/blob/main/db_design_final_project_UML.pdf <br/>
Description of User Data Model: The user model represents the player and stores a player id, first name, last name, username, password, email, and date of birth. <br/>
Description of the Two Domain Object Data Models: The Two Domain Objects that we are modeling are Characters and Weapons. Character Data Models contain character id, character name, level, rarity, base attack, base health, weapon type, and their element. Weapon Data Models contain weapon id, weapon name, weapon type, level, refinement level, rarity, base attack, ability name, and ability description.<br/>
Description of the User to Domain Object Relationship: We have a one to many relationship between our User and Character Models. This means that each user can own multiple characters. <br/>
Description of the Domain Object to Domain Object Relationship: We have a 0...1 to 1 relationship between our two Domain Objects, characters and weapons. This means that every character has to wield a weapon, while a weapon does not necessarily have to be wielded by a character and can just sit in your inventory. <br/>
Description of the Portable Enumeration(s): We have two enumerations, WeaponType and Element. WeaponType's enumerations are Bow, Polearm, Sword, Claymore, and Catalyst, and is used in both domain objects to define what weapons a character can use and what type a weapon is. Element's enumerations are Pyro, Cryo, Electro, Anemo, Geo, and Hydro, which define the elemental type of a character. <br/>
Description of the User Interface Requirements: <br/>
