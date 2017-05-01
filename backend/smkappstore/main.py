#!/usr/bin/python3

#skrip ini editan dari tea-module-installer
#tapi udah beda jauhh

from gi import require_version

#butuh versi GTK3 dan Vte 2.90
require_version('Gtk', '3.0')
require_version('Vte', '2.90')

import sys, os, platform
from gi.repository import Gtk, Vte, GLib

#nick atau nama aplikasi
nick = sys.argv[1]

#cek3 32bit atau 64bit
#import struct
#arch = struct.calcsize("P") * 8

#installer aplikasi
installerApp = 'installer/'+nick+'.sh'

#variable OS.environ untuk vte terminal
currentDir = os.path.split(os.path.abspath(os.path.realpath(sys.argv[0])))[0]
os.environ["SMK_INSTALLER"]=currentDir #membuat new path:SMK_INSTALLER

#main GTK
class SMK(Gtk.Window):
    def __init__(self, arguments):
        Gtk.Window.__init__(self)

        #set Gtk window properti
        self.set_title('SMK App Store - Memasang Aplikasi')
        self.set_border_width(15)
        self.set_default_size(700, 300)
        self.set_position(Gtk.WindowPosition.CENTER)

        #add_vbox
        vbox = Gtk.VBox(spacing=15)
        self.add(vbox)

        #add_hbox_atas
        hbox_1 = Gtk.HBox(spacing=15)
        vbox.pack_start(hbox_1, True, True, 0)

        #addlabel di hbox atas
        self.label_memasang = Gtk.Label("Memasang " +nick+ "...")
        hbox_1.pack_start(self.label_memasang, False, False, 0)

        #add_hbox 2
        hbox_2 = Gtk.HBox(spacing=15)
        vbox.pack_start(hbox_2, True, True, 0)

        #add_progress_bar di hbox 2
        self.progress_memasang = Gtk.ProgressBar()
        #self.progress_memasang.set_size_request(200, 10)
        self.progress_memasang.set_show_text(False)
        hbox_2.pack_start(self.progress_memasang, True, True, 0)

        if (self.checkInet() == True):
            #add_vte_terminal
            self.terminal = Vte.Terminal()
            self.terminal.connect('contents-changed', self.progress_pulse)
            self.terminal.fork_command_full(
                Vte.PtyFlags.DEFAULT,
                os.environ['SMK_INSTALLER'],
                ['./' +installerApp],
                [],
                GLib.SpawnFlags.DO_NOT_REAP_CHILD,
                None,
                None
            )
            self.terminal.connect("child-exited", self.show_finish_message)
            vbox.pack_start(self.terminal, True, True, 0)
        elif (self.checkInet() == False):
            self.pesanNoInet()

        #button_cancel_disabled
        self.batal = Gtk.Button("Batal")
        self.batal.set_sensitive(False)
        vbox.pack_end(self.batal, True, True, 0)

        self.show_all()
        self.connect("delete-event", Gtk.main_quit)
        self.connect("destroy", Gtk.main_quit)

    def progress_pulse(self, *args):
        self.progress_memasang.pulse()

    def show_finish_message(self, *args):
        message = Gtk.MessageDialog(
            self,
            Gtk.DialogFlags.MODAL,
            Gtk.MessageType.INFO,
            Gtk.ButtonsType.CLOSE, "Aplikasi selesai dipasang"
        )
        message.run()
        message.destroy()
        GLib.idle_add(Gtk.main_quit)

    #fungis cek inet
    def checkInet(self):
        import requests
        try:
            res = requests.get('http://google.com')
            return True
        except:
            return False

    def pesanNoInet(self):
        message = Gtk.MessageDialog(
            self,
            Gtk.DialogFlags.MODAL,
            Gtk.MessageType.INFO,
            Gtk.ButtonsType.CLOSE, "Tidak ada koneksi internet!"
        )
        message.run()
        message.destroy()
        GLib.idle_add(Gtk.main_quit)

if __name__ == "__main__":
    SMK(sys.argv)
    Gtk.main()
