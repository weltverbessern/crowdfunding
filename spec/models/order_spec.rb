describe Order do

  context "attributes" do

      it "generates UUID before validation on_create" do
        @order = Order.new
        @order.valid?
        expect(@order.uuid).to_not be_nil
      end

      it { expect(Order.primary_key).to eq('uuid') }

    end

  context "class methods" do

    describe ".next_order_number" do

      it "gives the next number" do
        allow_any_instance_of(ActiveRecord::Relation).to receive(:first).and_return(double( :order_number => 1 ))
        expect(Order.next_order_number).to eq(2)
      end

      context "no orders" do

          before do
            allow_any_instance_of(ActiveRecord::Relation).to receive(:first).and_return(nil)
            allow(Order).to receive(:count).and_return(0)
          end

          it "doesn't break if there's no orders" do
            expect { Order.next_order_number }.to_not raise_error
          end

          it "returns 1 if there's no orders" do
            expect(Order.next_order_number).to eq(1)
          end

      end

    end

    describe ".percent" do
      it "calculates the percent based on #goal and #revenue" do
        allow(Order).to receive(:revenue).and_return(6.2)
        allow(Order).to receive(:goal).and_return(2.5)

        expect(Order.percent).to eq(2.48 * 100)
      end
    end

    describe ".goal" do
      it "returns the project goal from Settings" do
        expect(Order.goal).to eq(Settings.project_goal)
      end
    end

    describe ".backers" do
      it "returns the number of orders" do
        Order.delete_all
        @order = Order.generate
        @order.product_name = 'marin'
        @order.user_id = 1
        @order.price = 123.21
        expect(Order.backers).to eq(0)

        @order.save!
        expect(Order.backers).to eq(1)
      end
    end

  end


  describe "validators" do

    it { should validate_presence_of :product_name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :user_id }

  end

end