ncvim.utils = {
  map = function(predicate, tbl)
    if nil == tbl then
      return nil
    end
    local t = {}
    for k, v in pairs(tbl) do
      t[k] = predicate(v)
    end
    return t
  end,

  filter = function(predicate, tbl)
    local t = {}
    for k, v in pairs(tbl) do
      if predicate(v) then
        t[k] = v
      end
    end
    return t
  end,
}
