<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddStatusToTransaction extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropColumn('mode');
            
        });
        Schema::table('transactions', function (Blueprint $table) {
            $table->enum('mode',['cod','paypal','card']);
            $table->enum('status',['pending','approved','declined','refunded'])->default('pending');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transactios', function (Blueprint $table) {
            $table->enum('mode',['cod','paypal','card']);
            $table->enum('status',['pending','approved','declined','refunded'])->default('pending');
        });
    }
}
