
# Globals
Atoms = @Atoms =
  version   : "0.0.7"
  Core      : Class: {}
  Atom      : {}
  Molecule  : {}
  Organism  : {}
  Template  : {}
  System    : Cache : {}
  # DOM Handler Facade
  $: (args...) -> if $$? then $$ args... else $ args...
