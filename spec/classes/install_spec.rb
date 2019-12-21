require 'spec_helper'

describe 'xorg::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it { is_expected.to contain_package('virtualbox-guest-utils-nox').with(ensure: 'absent') }
      it { is_expected.to contain_package('virtualbox-guest-utils').with(ensure: 'present') }

      it { is_expected.to contain_package('xorg-server').with(ensure: 'present') }
    end
  end
end
