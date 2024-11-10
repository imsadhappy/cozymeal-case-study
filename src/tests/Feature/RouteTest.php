<?php

namespace Tests\Feature;

use Tests\TestCase;

class RouteTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_homepage(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
