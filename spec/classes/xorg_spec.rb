require 'spec_helper'

describe 'xorg' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_package('xorg-server').with(ensure: 'present') }
    end
  end
end
