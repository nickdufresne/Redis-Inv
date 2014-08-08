subsystem :::::::::::::::
push key:qty
pop key:qty
temp holding
complete!

DETAILED SYSTEM ::::::::::::::::

POP EVERYTHING
save SOURCED
PUSH EVERYTHING
save SINKED
DELETE temp queues
save CLEANED

convert item,locator,unit,etc... to key, run transaction

on complete we can update qtys
item_id => {"lot|unit|locator|status"}
locator_id => {"item|lot|unit|status"}

index("item:100").incr("lot|unit|locator|status", qty)
