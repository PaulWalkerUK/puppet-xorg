require 'spec_helper'

describe 'xorg' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_package('xorg-server').with(ensure: 'present') }

      context 'with default parameters' do
        it { is_expected.not_to contain_package('libxkbcommon').with(ensure: 'present') }
        it { is_expected.not_to contain_exec('set_keyboard_layout') }
      end

      context 'with keyboard layout' do
        let(:params) { { 'keyboard_layout' => 'kb_layout' } }

        it { is_expected.to contain_package('libxkbcommon').with(ensure: 'present') }

        it {
          is_expected.to contain_exec('set_keyboard_layout').with(
            command: 'localectl set-x11-keymap kb_layout',
            path: ['/usr/local/bin/', '/bin/'],
            unless: "grep 'Option \"XkbLayout\" \"kb_layout\"' /etc/X11/xorg.conf.d/00-keyboard.conf",
          )
        }
      end
    end
  end
end
