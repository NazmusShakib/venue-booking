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
            $table->string('name')->index();
            $table->string('slug')->nullable()->index();
            $table->text('description')->nullable();
            $table->text('additional_info')->nullable();
            $table->foreignId('category_id')->constrained();
            $table->foreignId('occasion_id')->constrained();
            $table->foreignId('amenity_id')->constrained();
            $table->foreignId('division_id')->constrained();
            $table->foreignId('district_id')->constrained();
            $table->foreignId('city_id')->constrained();
            $table->boolean('is_enabled')->default(false)->index();
            $table->integer('created_by')->unsigned()->nullable()->index();
            $table->integer('updated_by')->unsigned()->nullable()->index();
            $table->timestamps();
        });

        Schema::table('venues', function(Blueprint $table)
        {
            $table->foreign('created_by')->references('id')->on('admin_users')->onDelete('SET NULL');
            $table->foreign('updated_by')->references('id')->on('admin_users')->onDelete('SET NULL');
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
