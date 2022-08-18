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
        Schema::create('venues', function (Blueprint $table) {
            $table->id();
            $table->string('featured_image')->nullable();
            $table->text('images')->nullable();
            $table->string('name')->index();
            $table->string('slug')->nullable()->index();
            $table->longText('description')->nullable();
            $table->text('additional_info')->nullable();
            $table->string('price_type')->index();
            $table->decimal('price', 11, 2)->index();
            $table->bigInteger('capacity')->index();
            $table->foreignId('division_id')->constrained();
            $table->foreignId('district_id')->constrained();
            $table->foreignId('city_id')->constrained();
            $table->boolean('is_enabled')->default(false)->index();
            $table->string('creator_type')->nullable()->index();
            $table->string('updater_type')->nullable()->index();
            $table->bigInteger('created_by')->nullable()->index();
            $table->bigInteger('updated_by')->nullable()->index();
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
        Schema::dropIfExists('venues');
    }
};
