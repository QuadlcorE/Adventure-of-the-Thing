VAR HeroKnight = 0
VAR Bandit = 0
VAR HeroHealth = 100
VAR EncounteredBandits = 0
-> Introduction
=== Introduction ===
You find yourself on a quest to uncover the lost treasure hidden deep within the Bandit's Lair.
-> RecurringBanditEncounter
=== RecurringBanditEncounter ===
- HeroKnight encounters (Bandit) bandits along the journey.
(HeroKnight) I must find the treasure hidden in the Bandit's Lair.
{EncounteredBandits == 0:
    (set: $EncounteredBandits to 1)
    (Bandit) Halt! This is bandit territory. Pay us 20 health, and we'll let you pass peacefully.
    * Option 1: Pay the health
        {HeroHealth >= 20:
            [Pay 20 health] -> ContinueOnPath 
        - else:
            [Refuse] -> FightBandits
        }
    * Option 2: Refuse -> FightBandits
}
{EncounteredBandits > 0:
    (Bandit) You again! Pay up or prepare to fight.
    * Option 1: Pay the health
        {HeroHealth >= 20:
            [Pay 20 health] -> ContinueOnPath 
        - else:
            [Refuse] -> FightBandits
        }
    * Option 2: Refuse -> FightBandits
}
=== ContinueOnPath ===
(once: $HeroHealth >= 20)
(HeroKnight) I paid the toll and continue on my way.
* [ContinueOnPath] -> END
=== FightBandits ===
(HeroKnight) I won't be extorted. Prepare to fight!
-> END