require 'spec_helper'

describe Document do
  let(:doc) { Document.create name: 'Test Document', size: 512 }

  it { should respond_to(:name) }
  it { should respond_to(:size) }
  it { should respond_to(:user) }
end
