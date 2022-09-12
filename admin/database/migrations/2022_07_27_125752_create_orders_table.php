<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('venue_id')->constrained()->cascadeOnDelete();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->foreignId('category_id')->constrained();
            $table->foreignId('occasion_id')->constrained();
            $table->dateTime('start_date')->nullable()->index();
            $table->dateTime('end_date')->nullable()->index();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('mobile_number')->nullable();
            $table->bigInteger('capacity')->index();
            $table->bigInteger('total_guests')->nullable();
            $table->string('price_type')->index();
            $table->decimal('net_total_price', 11, 2)->index();
            $table->text('address')->nullable();
            $table->boolean('receive_promotional_offers')->default(false);
            $table->boolean('agree')->default(false);
            $table->enum('status', ['pending', 'approved', 'rejected', 'completed'])->default('pending');
            $table->string('transaction_id')->nullable();
            $table->string('currency')->nullable();
            $table->enum('payment_status', ['pending', 'canceled', 'complete', 'failed', 'processing'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
