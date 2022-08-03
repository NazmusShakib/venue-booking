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
        Schema::create('event_calendars', function (Blueprint $table) {
            $table->id();
            $table->foreignId('venue_id')->constrained()->cascadeOnDelete();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->text('feedback')->nullable();
            $table->dateTime('start_date')->nullable()->index();
            $table->dateTime('end_date')->nullable()->index();
            $table->boolean('all_day_event')->default(true)->index();
            $table->enum('status', ['pending', 'approved', 'rejected', 'completed'])->default('pending');
            $table->foreignId('created_by')->constrained('users')->cascadeOnDelete();
            $table->integer('updated_by')->unsigned()->nullable()->index();
            $table->timestamps();
        });

        Schema::table('event_calendars', function(Blueprint $table)
        {
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
        Schema::dropIfExists('event_calendars');
    }
};
