{$INCLUDE 'SpawnerTemplate.dws'};

procedure CreateData(Entity : TEntity);
begin
  InitSpawnerData(Entity, False, {@UBL_Tier}2);

  Entity.Blackboard.SetValue(eiWelaUnitPattern, [GROUP_TEMPLATE_SPAWNER], 'Units\Green\Rootdude');
  Entity.Blackboard.SetValue(eiWelaCount, [GROUP_TEMPLATE_SPAWNER], {@UBL_SquadSize}1);
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
