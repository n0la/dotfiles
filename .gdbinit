python
import sys
sys.path.insert(0, '/home/flo/.dotfiles/gdbprinters')

from qt4 import register_qt4_printers
register_qt4_printers (None)

from kde4 import register_kde4_printers
register_kde4_printers (None)

from libstdcxx import register_libstdcxx_printers
register_libstdcxx_printers (None)

end
