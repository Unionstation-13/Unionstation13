Aquatic Mech Species Module for Baystation12 
Overview 

This module adds a fully functional aquatic mech species to Baystation12 that requires water to survive and must wear special protective equipment to operate on land. 
Features 

     Aquatic Biology: Species requires water to survive and will suffocate on land
     Environmental Protection Suit: Specialized mech suit with water circulation, power systems, and integrity monitoring
     Auto-Equipment: Players automatically receive protective suit upon spawning
     Charging Stations: Dedicated stations to replenish suit water and power
     Modular Design: Completely self-contained with no modifications to existing code
     

Module Structure 

This module is designed for maximum ease of porting and self-sufficiency: 
Core Files 

     __init_newest.dm - Main module loader
     aquatic_species_newest.dm - Species definition and mechanics
     aquatic_mech_suit_newest.dm - Protective suit and systems
     aquatic_mech_charger_newest.dm - Charging station functionality
     

Design Philosophy 

     Zero Dependencies: Does not modify any existing Baystation12 files
     Tab Indentation: All code uses proper tab indentation for BYOND compatibility
     Modular Architecture: Each component is self-contained and independent
     Easy Integration: Simple include directive in DME file
     

Installation 

     Copy all DM files to your Baystation12 code directory
     Create blank .dmi icon files for sprites
     Add #include "aquatic_mech_species/__init_newest.dm" to your DME file
     Compile and restart server
     

Gameplay Mechanics 
Species Abilities 

     Can breathe underwater indefinitely
     Takes suffocation damage when out of water
     Must wear environmental protection suit on land
     

Protection Suit Features 

     Water Reservoir: Maintains internal water supply
     Power System: Electrical components for suit operation
     Integrity Monitoring: Tracks suit damage and functionality
     Automatic Alerts: Warns user of critical conditions
     

Charging Station 

     Replenishes suit water supply
     Recharges suit power systems
     User-friendly interface with status indicators
     

Technical Implementation 

The module uses Baystation12's existing systems: 

     /singleton/species framework for species definition
     /obj/item/clothing for protective equipment
     /obj/machinery for charging stations
     Standard BYOND DM syntax and conventions
     

Porting Notes 

This module is designed to be easily portable between different Baystation12 installations: 

     No hardcoded paths or dependencies
     Uses standard Baystation12 APIs and frameworks
     Modular structure allows for easy customization
     Tab indentation ensures compatibility across different development environments
     

Credits 

Chief Creator: Chickenking1234 
Lead Developer/Coder: LegateJulius/lordofmen
Lead developer and designer of the aquatic mech species module, responsible for the complete implementation including species mechanics, protective equipment systems, and charging infrastructure. 

This module was created with the goal of providing a unique and engaging gameplay experience while maintaining compatibility and ease of integration with existing Baystation12 systems and was made for the server Unionstation13. Do not remove this section unless extremely extensive changes have occured to the module.
