{$INCLUDE 'Math.dws'};

var Game : TGame;
var InheritsFrom : string = 'Units\Neutral\Lanetower.ets';

procedure CreateData(Entity : TEntity);
begin
  // 2v2 - PvP
  {$IFNDEF MAPEDITOR}
  if Game.IsDuo and Game.IsPvP and Game.IsOneLane then
  begin
    Entity.Blackboard.SetIndexedValue(eiResourceCap, [], reHealth, 2.0 * f([1000.0, 1200.0, 1400.0, 1400.0, 1400.0], Entity.CardLeague));
    Entity.Blackboard.SetIndexedValue(eiResourceBalance, [], reHealth, 2.0 * f([1000.0, 1200.0, 1400.0, 1400.0, 1400.0], Entity.CardLeague));
  end
  else
  // Rest
  {$ENDIF}
  begin
    Entity.Blackboard.SetIndexedValue(eiResourceCap, [], reHealth, f([1000.0, 1200.0, 1400.0, 1400.0, 1400.0], Entity.CardLeague));
    Entity.Blackboard.SetIndexedValue(eiResourceBalance, [], reHealth, f([1000.0, 1200.0, 1400.0, 1400.0, 1400.0], Entity.CardLeague));
  end;

  Entity.Blackboard.SetValue(eiWelaUnitPattern, [0, 1], 'Projectiles\Neutral\LanetowerLevel2Projectile');

  if Entity.CardLeague > 2 then
  begin
    // Upgrade effect
    Entity.Blackboard.SetValue(eiWelaUnitPattern, [4], 'Units\Neutral\LanetowerLevel3');
  end;

  {$IFDEF CLIENT}
    Entity.Blackboard.SetIndexedValue(eiUnitData, [], udHealthbarOffset, 1.9);

    if Entity.CardLeague > 2 then
      TTooltipUnitAbilityComponent.CreateGrouped(Entity, [4], 'LanetowerUpgrade');
  {$ENDIF}
end;

procedure CreateMeta(Entity : TEntity);
begin
  CreateData(Entity);

  {$IFDEF CLIENT}
    TClickCollisionComponent.Create(Entity).SetCapsule(RVector3.Create(0,0,0), RVector3.Create(0,4,0), 1.2);

    TMeshComponent.CreateGrouped(Entity, [2], 'Units\Neutral\Lanetower\LanetowerCrystal.xml')
      .CreateNewAnimation(ANIMATION_STAND, 0, 201)
      .BindTextureToTeam(mtDiffuse, 'LanetowerDiffuse.tga', 1)
      .BindTextureToTeam(mtDiffuse, 'LanetowerDiffuse2.tga', 2)
      .BindTextureToTeam(mtGlow, 'LanetowerGlow.tga', 1)
      .BindTextureToTeam(mtGlow, 'LanetowerGlow2.tga', 2);

    TMeshEffectComponent.CreateGrouped(Entity, [2])
      .SetEffect(
        TMeshEffectMatCap.Create()
          .SetTexture(PATH_GRAPHICS_EFFECTS_TEXTURES + 'MatcapCrystal%d.png')
      );

    TMeshEffectComponent.CreateGrouped(Entity, [0, 1, 2])
      .SetEffect(
        TMeshEffectSpawn.Create()
          .OverrideColor($FF505958)
          .OverrideColorIdentity(ecWhite)
      );
  {$ENDIF}
end;

procedure CreateEntity(Entity : TEntity);
begin
  CreateMeta(Entity);

  if Entity.CardLeague > 2 then
  begin
    {$IFDEF SERVER}
      // Replace with tower of next level if stage has increased
      TAutoBrainOnGameEventComponent.CreateGrouped(Entity, [4])
        .SetEvent(GAME_EVENT_TECH_LEVEL_3);
      TWelaEffectReplaceComponent.CreateGrouped(Entity, [4])
        .KeepTakenDamage()
        .KeepResource(reWelaCharge);
    {$ENDIF}

    {$IFDEF CLIENT}
      TIndicatorCooldownCircleComponent.CreateGrouped(Entity, [4])
        .ShowsGameEvent(GAME_EVENT_TECH_LEVEL_3, 4 * 60)
        .Invert
        .SetTexture(PATH_GRAPHICS_EFFECTS_TEXTURES + 'ProgressCircle.tga')
        .SetRadius(1.94)
        .SetThickness(0.4)
        .Offset(0, 0, 0.05)
        .SetLinearBlend
        .Opacity(0.7);
    {$ENDIF}
  end;
end;

