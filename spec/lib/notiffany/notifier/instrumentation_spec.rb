# frozen_string_literal: true

require "notiffany/notifier/instrumentation"

module Notiffany
  RSpec.describe Notifier::Instrumentation do
    let(:options) { {} }
    subject { described_class.new(options) }

    module FakeActiveSupport
      module Notifications
        class << self
          def instrument(name, payload = {}) end
        end
      end

      def self.installed?
      end
    end

    let (:active_support) { FakeActiveSupport }

    before do
      allow(Kernel).to receive(:require)
      stub_const "ActiveSupport", active_support
      allow(active_support).to receive(:installed?).and_return(true)
    end

    describe "#notify" do
      let(:options) { {} }
      context "with options passed at initialization" do
        let(:options) { {} }

        it "succeeds" do
          subject.notify("any message")
        end
      end
    end
  end
end
