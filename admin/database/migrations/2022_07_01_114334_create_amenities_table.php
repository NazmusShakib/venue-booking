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
        Schema::create('amenities', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('slug')->nullable()->index();
            $table->text('remarks')->nullable();
            $table->integer('created_by')->unsigned()->nullable()->index();
            $table->integer('updated_by')->unsigned()->nullable()->index();
            $table->timestamps();
        });

        Schema::table('amenities', function(Blueprint $table)
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
        Schema::dropIfExists('amenities');
    }
};
