require 'weapon'

#battle_bot.rb
class BattleBot
  attr_reader :name, :health, :enemies, :weapon

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @dead = false
  end

  def attack(another_bot)
    if another_bot.class != BattleBot
      raise ArgumentError, ""
    end

    another_bot.take_damage(@weapon.damage)
  end

  def dead?
    @dead
  end

  def has_weapon?
    if @weapon.nil?
      return false
    end

    true
  end

  

  def name=(str)
    raise NoMethodError, "no method"
  end

  def health=(str)
    raise NoMethodError, "no method"
  end

  def enemies=(str)
    raise NoMethodError, "no method"
  end

  def weapon=(str)
    raise NoMethodError, "no method"
  end

  def pick_up(weapon_name)
    if @name.class != Weapon
      raise ArgumentError 
    end

    @weapon = weapon_name if @weapon == nil
    @weapon.bot = @name
  end

  def drop_weapon
    @weapon = nil
  end

  def take_damage(damage)
    if damage > @health
      @health = 0
      @dead = true
    else
      @health -= damage
    end
    @health
  end

  def heal 
      @health += 10 unless @health == 0 || (@health + 10) > 100
    end


end