require 'spec_helper'

describe 'xorg::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      
      it { is_expected.to contain_package('virtualbox-guest-utils-nox').with(ensure: 'absent') }
      it { is_expected.to contain_package('virtualbox-guest-utils').with(ensure: 'present') }
      
      it { is_expected.to contain_package('xorg').with(ensure: 'present') }
      it { is_expected.to contain_package('virtualbox-guest-modules-arch').with(ensure: 'present') }
      it { is_expected.to contain_package('mesa').with(ensure: 'present') }
      
      it { is_expected.to contain_package('xorg-server').with(ensure: 'present') }
      it { is_expected.to contain_package('xorg-apps').with(ensure: 'present') }
      it { is_expected.to contain_package('xorg-xinit').with(ensure: 'present') }
      it { is_expected.to contain_package('xterm').with(ensure: 'present') }
    end
  end
end
