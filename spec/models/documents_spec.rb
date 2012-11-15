require 'spec_helper'

describe Document do
  let(:doc) { Document.create name: 'test_document.txt', size: 512 }

  it { should respond_to(:name) }
  it { should respond_to(:size) }
  it { should respond_to(:user) }
  it { should respond_to(:type) }

  subject { doc }

  its(:name) { should == 'test_document.txt' }
  its(:type) { should == 'txt' }
end
