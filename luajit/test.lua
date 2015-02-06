#!/usr/bin/env luajit

local Mrg = require('mrg')
local mrg = Mrg.new(512,384,"gtk");
local x = 0.1;
local y = 0.1;

mrg:set_ui(
function (mrg, data)
  local cr = mrg:cr()

  mrg:set_font_size(32)
  mrg:set_xy(0, mrg:em()*1.2);
  mrg:print_xml("<div style='color:red'>luajit + mrg</div> \n")

  cr:new_path()
  cr:set_source_rgb(0,0,0)
  cr:arc (x, y, 20, 0, 3.14151*2)
  cr:stroke ()

  mrg:listen(Mrg.MOTION, 0, 0, mrg:width(), mrg:height(), function (event, d1, d2)
       x = event.x; y = event.y;
       event.mrg:queue_draw(NULL)
       return 0
     end)

  mrg:add_binding("control-q", NULL, NULL, function (foo) mrg:quit() return 0 end)

end)
mrg:main()

