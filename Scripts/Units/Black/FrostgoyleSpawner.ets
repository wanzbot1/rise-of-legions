{$INCLUDE 'SpawnerTemplate.dws'};

procedure CreateData(Entity : TEntity);
begin
  InitSpawnerData(Entity, False, {@UBL_Tier}2);

  Entity.Blackboard.SetValue(eiWelaUnitPattern, [GROUP_TEMPLATE_SPAWNER], 'Units\Black\Frostgoyle');
  Entity.Blackboard.SetValue(eiWelaCount, [GROUP_TEMPLATE_SPAWNER], {@UBL_SpawnerSquadSize}2);
end;

procedure CreateMeta(Entity : TEntity);
begin
  CreateData(Entity);
  InitSpawnerMeta(Entity);

  {$IFDEF CLIENT}
  {$ENDIF}
end;

procedure CreateEntity(Entity : TEntity);
begin
  CreateMeta(Entity);
  InitSpawnerEntity(Entity);

  {$IFDEF SERVER}
  {$ENDIF}

  {$IFDEF CLIENT}
  {$ENDIF}
end;
